# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\noise_pm1\3IOL\seeds\seed_0\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 2.992 A
- tm_score_ca_ordered: 0.12344075271011969
- heavy_atom_rmsd: 4.779 A
- sidechain_heavy_atom_rmsd: 5.768 A
- **all-atom quality (honest):** heavy 4.779 A, sidechain 5.768 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 231
- bin_accuracy: 0.671

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** V6 → 5 conflicts (100%)
- explained: 5/5 conflicts by 1 root cause(s)
- metrics: hubs=2 (frac 0.083), conflicts/hub=2.5, max_incompat=3.65Å, chain_span=0.667
- **fix-first:** [LOW_CONFLICT] Root cause(s): V6 — explain ~5/5 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L22** — severity 4.83, 3 conflict(s); suspect input ~`V6` (group: pull_in)
  - pull-in (wants closer): V6@22.0Å(now 24.6,conf 0.55)
  - T3↔V6: targets 31.1/22.0Å but partners are 5.5Å apart → too_close_together by 3.6Å
  - T1↔V6: targets 31.7/22.0Å but partners are 6.8Å apart → too_close_together by 3.0Å
  - F2↔V6: targets 30.4/22.0Å but partners are 6.2Å apart → too_close_together by 2.2Å
- **V6** — severity 2.25, 2 conflict(s); suspect input ~`F2` (group: pull_in)
  - pull-in (wants closer): L22@22.0Å(now 24.6,conf 0.55)
  - L22↔F2: targets 22.0/6.2Å but partners are 30.7Å apart → too_far_apart by 2.5Å
  - L22↔T3: targets 22.0/5.5Å but partners are 29.4Å apart → too_far_apart by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=8 · 3-10(G)=1 · coil(C)=1

```
EHEHEHEHEHHEEHHEGHHHHHHC
```

## Backbone H-bond Network

- total=15 · helix(i→i+4)=9 · sheet=6
  - F2 ↔ V6  (helix)
  - S4 ↔ S8  (helix)
  - V6 ↔ L10  (helix)
  - L10 ↔ A14  (helix)
  - E11 ↔ A15  (helix)
  - A14 ↔ F18  (helix)
  - A15 ↔ I19  (helix)
  - F18 ↔ L22  (helix)
  - I19 ↔ V23  (helix)
  - T1 ↔ S7  (sheet)
  - T3 ↔ Y9  (sheet)
  - D5 ↔ G12  (sheet)
  - S7 ↔ G12  (sheet)
  - S7 ↔ Q13  (sheet)
  - Y9 ↔ K16  (sheet)

## Solvent Accessibility (burial)

- buried=10 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=69 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0775 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
