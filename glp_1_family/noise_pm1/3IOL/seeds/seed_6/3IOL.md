# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\noise_pm1\3IOL\seeds\seed_6\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 1.930 A
- tm_score_ca_ordered: 0.33165961885282585
- heavy_atom_rmsd: 3.664 A
- sidechain_heavy_atom_rmsd: 4.567 A
- **all-atom quality (honest):** heavy 3.664 A, sidechain 4.567 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 274
- bin_accuracy: 0.693

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** F2-S8 → 7 conflicts (100%)
- explained: 7/7 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.167), conflicts/hub=1.8, max_incompat=3.38Å, chain_span=0.75
- **fix-first:** [LOW_CONFLICT] Root cause(s): F2-S8 — explain ~7/7 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V6** — severity 2.16, 2 conflict(s); suspect input ~`F2` (group: pull_in)
  - pull-in (wants closer): L22@22.0Å(now 24.6,conf 0.55)
  - L22↔F2: targets 22.0/6.2Å but partners are 30.4Å apart → too_far_apart by 2.2Å
  - L22↔T3: targets 22.0/5.5Å but partners are 29.4Å apart → too_far_apart by 2.0Å
- **L22** — severity 1.85, 1 conflict(s); suspect input ~`V6` (group: pull_in)
  - pull-in (wants closer): V6@22.0Å(now 24.6,conf 0.55)
  - T3↔V6: targets 31.1/22.0Å but partners are 5.7Å apart → too_close_together by 3.4Å
- **S8** — severity 1.74, 2 conflict(s); suspect input ~`F2` (group: push_out)
  - pull-in (wants closer): S4@5.8Å(now 8.6,conf 0.52)
  - push-out (wants farther): L10@5.4Å(now 2.9,conf 0.34)
  - S4↔F2: targets 5.8/10.9Å but partners are 3.0Å apart → too_close_together by 2.2Å
  - K24↔S4: targets 22.3/5.8Å but partners are 29.6Å apart → too_far_apart by 1.5Å
- **S4** — severity 1.65, 2 conflict(s); suspect input ~`S8` (group: push_out)
  - pull-in (wants closer): S8@5.8Å(now 8.6,conf 0.52)
  - push-out (wants farther): T1@8.2Å(now 4.7,conf 0.45)
  - K24↔S8: targets 30.5/5.8Å but partners are 23.1Å apart → too_close_together by 1.7Å
  - S8↔L10: targets 5.8/10.4Å but partners are 2.9Å apart → too_close_together by 1.8Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=6 · 3-10(G)=3 · coil(C)=0

```
EHHHEHHEHEHGHHGHHHHEGHHE
```

## Backbone H-bond Network

- total=10 · helix(i→i+4)=8 · sheet=2
  - F2 ↔ V6  (helix)
  - T3 ↔ S7  (helix)
  - S7 ↔ E11  (helix)
  - Y9 ↔ Q13  (helix)
  - Q13 ↔ E17  (helix)
  - A14 ↔ F18  (helix)
  - F18 ↔ L22  (helix)
  - I19 ↔ V23  (helix)
  - T1 ↔ S8  (sheet)
  - D5 ↔ L10  (sheet)

## Solvent Accessibility (burial)

- buried=10 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=64 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0208 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
