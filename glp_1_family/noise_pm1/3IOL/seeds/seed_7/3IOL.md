# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\noise_pm1\3IOL\seeds\seed_7\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 2.475 A
- tm_score_ca_ordered: 0.3044410868710971
- heavy_atom_rmsd: 4.555 A
- sidechain_heavy_atom_rmsd: 5.651 A
- **all-atom quality (honest):** heavy 4.555 A, sidechain 5.651 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 274
- bin_accuracy: 0.726

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** T1 → 8 conflicts (73%); L22 → 3 conflicts (27%)
- explained: 11/11 conflicts by 2 root cause(s)
- metrics: hubs=5 (frac 0.208), conflicts/hub=2.2, max_incompat=3.73Å, chain_span=0.875
- **fix-first:** [LOW_CONFLICT] Root cause(s): T1 + L22 — explain ~11/11 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T1** — severity 4.67, 4 conflict(s); suspect input ~`Y9` (group: pull_in)
  - pull-in (wants closer): D5@5.1Å(now 7.7,conf 0.56), Y9@10.5Å(now 13.6,conf 0.44)
  - E11↔Y9: targets 17.2/10.5Å but partners are 3.0Å apart → too_close_together by 3.7Å
  - D5↔E11: targets 5.1/17.2Å but partners are 9.5Å apart → too_close_together by 2.6Å
  - A14↔Y9: targets 20.8/10.5Å but partners are 7.8Å apart → too_close_together by 2.4Å
- **D5** — severity 3.53, 3 conflict(s); suspect input ~`Y9` (group: push_out)
  - pull-in (wants closer): T1@5.1Å(now 7.7,conf 0.56)
  - push-out (wants farther): S7@5.4Å(now 2.7,conf 0.42)
  - T1↔Y9: targets 5.1/5.1Å but partners are 13.6Å apart → too_far_apart by 3.4Å
  - T1↔E11: targets 5.1/9.1Å but partners are 16.3Å apart → too_far_apart by 2.1Å
  - T1↔G12: targets 5.1/9.0Å but partners are 15.6Å apart → too_far_apart by 1.6Å
- **V6** — severity 2.26, 2 conflict(s); suspect input ~`F2` (group: pull_in)
  - pull-in (wants closer): L22@22.0Å(now 24.6,conf 0.55)
  - L22↔F2: targets 22.0/6.2Å but partners are 30.5Å apart → too_far_apart by 2.3Å
  - L22↔T3: targets 22.0/5.5Å but partners are 29.6Å apart → too_far_apart by 2.1Å
- **L22** — severity 1.93, 1 conflict(s); suspect input ~`V6` (group: pull_in)
  - pull-in (wants closer): V6@22.0Å(now 24.6,conf 0.55)
  - T3↔V6: targets 31.1/22.0Å but partners are 5.6Å apart → too_close_together by 3.5Å
- **Y9** — severity 0.99, 1 conflict(s); suspect input ~`T1` (group: pull_in)
  - pull-in (wants closer): T1@10.5Å(now 13.6,conf 0.44)
  - A14↔T1: targets 7.7/10.5Å but partners are 20.4Å apart → too_far_apart by 2.2Å

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=7 · 3-10(G)=0 · coil(C)=0

```
EEHHEHEHEHHHHHHEHHHHHHHE
```

## Backbone H-bond Network

- total=14 · helix(i→i+4)=10 · sheet=4
  - S4 ↔ S8  (helix)
  - V6 ↔ L10  (helix)
  - S8 ↔ G12  (helix)
  - L10 ↔ A14  (helix)
  - E11 ↔ A15  (helix)
  - Q13 ↔ E17  (helix)
  - A14 ↔ F18  (helix)
  - A15 ↔ I19  (helix)
  - F18 ↔ L22  (helix)
  - I19 ↔ V23  (helix)
  - T1 ↔ S7  (sheet)
  - F2 ↔ S7  (sheet)
  - Y9 ↔ K16  (sheet)
  - K16 ↔ K24  (sheet)

## Solvent Accessibility (burial)

- buried=10 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=67 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0108 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
