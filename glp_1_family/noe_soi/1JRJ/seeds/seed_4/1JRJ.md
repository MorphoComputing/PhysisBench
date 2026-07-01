# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe_soi\1JRJ\seeds\seed_4\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 11.853 A
- tm_score_ca_ordered: 0.03269074979118345
- heavy_atom_rmsd: 12.107 A
- sidechain_heavy_atom_rmsd: 12.348 A
- **all-atom quality (honest):** heavy 12.107 A, sidechain 12.348 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 209
- bin_accuracy: 0.488

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** L20-W24 → 8 conflicts (50%); N27-G28 → 5 conflicts (31%); M13 → 3 conflicts (19%)
- explained: 16/16 conflicts by 3 root cause(s)
- metrics: hubs=11 (frac 0.297), conflicts/hub=1.5, max_incompat=5.12Å, chain_span=0.514
- **fix-first:** [LOW_CONFLICT] Root cause(s): L20-W24 + N27-G28 + M13 — explain ~16/16 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **N27** — severity 3.64, 2 conflict(s); suspect input ~`A34` (group: push_out)
  - push-out (wants farther): A34@12.1Å(now 7.8,conf 0.57)
  - G28↔A34: targets 3.8/12.1Å but partners are 3.1Å apart → too_close_together by 5.1Å
  - A34↔S32: targets 12.1/6.8Å but partners are 1.9Å apart → too_close_together by 3.3Å
- **G28** — severity 3.25, 3 conflict(s); suspect input ~`W24` (group: push_out)
  - push-out (wants farther): F21@12.6Å(now 9.0,conf 0.88), S31@9.6Å(now 5.8,conf 0.65), G33@10.6Å(now 6.8,conf 0.57), P35@10.5Å(now 4.1,conf 0.53), A34@10.7Å(now 3.1,conf 0.43), S32@7.2Å(now 3.4,conf 0.20)
  - F21↔W24: targets 12.6/6.4Å but partners are 3.7Å apart → too_close_together by 2.5Å
  - N27↔P35: targets 3.8/10.5Å but partners are 4.7Å apart → too_close_together by 2.0Å
  - A34↔S32: targets 10.7/7.2Å but partners are 1.9Å apart → too_close_together by 1.6Å
- **L20** — severity 2.04, 2 conflict(s); suspect input ~`E16` (group: push_out)
  - push-out (wants farther): W24@7.1Å(now 4.6,conf 0.88), M13@10.2Å(now 6.3,conf 0.74), K26@9.5Å(now 6.2,conf 0.64), I22@5.4Å(now 1.6,conf 0.56)
  - M13↔E16: targets 10.2/6.1Å but partners are 0.4Å apart → too_close_together by 3.7Å
  - K26↔E23: targets 9.5/5.0Å but partners are 2.2Å apart → too_close_together by 2.3Å
- **W24** — severity 1.29, 2 conflict(s); suspect input ~`P35` (group: pull_in)
  - pull-in (wants closer): A34@6.1Å(now 9.5,conf 0.31), P35@6.1Å(now 9.8,conf 0.31)
  - push-out (wants farther): L20@7.1Å(now 4.6,conf 0.88), A17@10.5Å(now 7.4,conf 0.59), K26@5.4Å(now 2.5,conf 0.34), P37@7.2Å(now 3.6,conf 0.20)
  - I22↔P35: targets 5.4/6.1Å but partners are 13.6Å apart → too_far_apart by 2.1Å
  - E23↔A34: targets 3.8/6.1Å but partners are 12.0Å apart → too_far_apart by 2.0Å
- **R19** — severity 1.17, 1 conflict(s); suspect input ~`E16` (group: pull_in)
  - pull-in (wants closer): E16@5.4Å(now 8.1,conf 0.36)
  - M13↔E16: targets 9.0/5.4Å but partners are 0.4Å apart → too_close_together by 3.2Å
- **A17** — severity 1.10, 1 conflict(s); suspect input ~`E23` (group: push_out)
  - push-out (wants farther): W24@10.5Å(now 7.4,conf 0.59), E23@9.2Å(now 6.1,conf 0.57), E15@5.4Å(now 1.7,conf 0.56)
  - E16↔E23: targets 3.8/9.2Å but partners are 3.5Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=12 · 3-10(G)=3 · coil(C)=2

```
CECEEEEHHHEHHHHHEHGHHHHHHEEHHGHGHEEHE
```

## Backbone H-bond Network

- total=26 · helix(i→i+4)=10 · sheet=16
  - D8 ↔ Q12  (helix)
  - L9 ↔ M13  (helix)
  - S10 ↔ E14  (helix)
  - Q12 ↔ E16  (helix)
  - E16 ↔ L20  (helix)
  - L20 ↔ W24  (helix)
  - F21 ↔ L25  (helix)
  - W24 ↔ G28  (helix)
  - L25 ↔ G29  (helix)
  - G29 ↔ G33  (helix)
  - F5 ↔ K11  (sheet)
  - F5 ↔ A17  (sheet)
  - T6 ↔ K11  (sheet)
  - S7 ↔ A17  (sheet)
  - S7 ↔ K26  (sheet)
  - K11 ↔ A17  (sheet)
  - K11 ↔ K26  (sheet)
  - A17 ↔ K26  (sheet)
  - A17 ↔ N27  (sheet)
  - A17 ↔ P37  (sheet)
  - … +6 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=13 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=185 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=85 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.9464 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=6 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
