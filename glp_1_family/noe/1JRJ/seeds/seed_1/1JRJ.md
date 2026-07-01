# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe\1JRJ\seeds\seed_1\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 7.958 A
- tm_score_ca_ordered: 0.07727688261813369
- heavy_atom_rmsd: 8.627 A
- sidechain_heavy_atom_rmsd: 8.950 A
- **all-atom quality (honest):** heavy 8.627 A, sidechain 8.950 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 4
- distogram_pairs: 90
- bin_accuracy: 0.678

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** K11-E16 → 23 conflicts (100%)
- explained: 23/23 conflicts by 1 root cause(s)
- metrics: hubs=6 (frac 0.162), conflicts/hub=3.8, max_incompat=6.97Å, chain_span=0.216
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): K11-E16 — explain ~23/23 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Q12** — severity 12.10, 8 conflict(s); suspect input ~`D8` (group: pull_in)
  - pull-in (wants closer): E15@5.0Å(now 9.3,conf 0.40), E16@6.1Å(now 10.6,conf 0.33)
  - E15↔D8: targets 5.0/6.1Å but partners are 17.3Å apart → too_far_apart by 6.2Å
  - D8↔E16: targets 6.1/6.1Å but partners are 17.8Å apart → too_far_apart by 5.6Å
  - L9↔E15: targets 5.0/5.0Å but partners are 14.5Å apart → too_far_apart by 4.4Å
- **E14** — severity 8.56, 6 conflict(s); suspect input ~`K11` (group: pull_in)
  - pull-in (wants closer): K11@5.4Å(now 10.0,conf 0.37), A17@5.4Å(now 8.1,conf 0.37)
  - K11↔A17: targets 5.4/5.4Å but partners are 17.8Å apart → too_far_apart by 7.0Å
  - E15↔K11: targets 3.8/5.4Å but partners are 13.1Å apart → too_far_apart by 3.9Å
  - K11↔V18: targets 5.4/6.1Å but partners are 15.8Å apart → too_far_apart by 4.3Å
- **E15** — severity 3.08, 3 conflict(s); suspect input ~`Q12` (group: pull_in)
  - pull-in (wants closer): Q12@5.0Å(now 9.3,conf 0.40)
  - A17↔Q12: targets 5.4/5.0Å but partners are 14.1Å apart → too_far_apart by 3.6Å
  - Q12↔V18: targets 5.0/5.0Å but partners are 12.4Å apart → too_far_apart by 2.4Å
  - E16↔Q12: targets 3.8/5.0Å but partners are 10.6Å apart → too_far_apart by 1.7Å
- **K11** — severity 2.97, 2 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): E14@5.4Å(now 10.0,conf 0.37)
  - E14↔S7: targets 5.4/6.1Å but partners are 16.4Å apart → too_far_apart by 4.9Å
  - D8↔E14: targets 5.0/5.4Å but partners are 14.1Å apart → too_far_apart by 3.6Å
- **E16** — severity 2.40, 2 conflict(s); suspect input ~`Q12` (group: pull_in)
  - pull-in (wants closer): Q12@6.1Å(now 10.6,conf 0.33)
  - A17↔Q12: targets 3.8/6.1Å but partners are 14.1Å apart → too_far_apart by 4.2Å
  - Q12↔L20: targets 6.1/6.1Å but partners are 15.4Å apart → too_far_apart by 3.1Å
- **D8** — severity 1.03, 2 conflict(s); suspect input ~`F5` (group: pull_in)
  - pull-in (wants closer): F5@6.5Å(now 10.1,conf 0.24)
  - K11↔F5: targets 5.0/6.5Å but partners are 13.7Å apart → too_far_apart by 2.1Å
  - Q12↔F5: targets 6.1/6.5Å but partners are 14.7Å apart → too_far_apart by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=21 · strand(E)=10 · 3-10(G)=5 · coil(C)=1

```
CEHHHHEGHHHEEEGGHHHHHHHHHHEHHGGHHEEEE
```

## Backbone H-bond Network

- total=17 · helix(i→i+4)=11 · sheet=6
  - F5 ↔ L9  (helix)
  - A17 ↔ F21  (helix)
  - V18 ↔ I22  (helix)
  - R19 ↔ E23  (helix)
  - L20 ↔ W24  (helix)
  - F21 ↔ L25  (helix)
  - I22 ↔ K26  (helix)
  - W24 ↔ G28  (helix)
  - L25 ↔ G29  (helix)
  - G28 ↔ S32  (helix)
  - G29 ↔ G33  (helix)
  - E2 ↔ S7  (sheet)
  - S7 ↔ Q12  (sheet)
  - N27 ↔ A34  (sheet)
  - N27 ↔ P35  (sheet)
  - N27 ↔ P36  (sheet)
  - N27 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=9 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=125 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=29 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.008 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=4 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
