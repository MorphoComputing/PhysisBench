# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\5WOW\seeds\seed_1\5WOW.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 5.775 A
- tm_score_ca_ordered: 0.1928610597258097
- heavy_atom_rmsd: 6.985 A
- sidechain_heavy_atom_rmsd: 8.019 A
- **all-atom quality (honest):** heavy 6.985 A, sidechain 8.019 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 14
- distogram_pairs: 177
- bin_accuracy: 0.384

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Y27-Y30 → 16 conflicts (76%); D33-Y37 → 3 conflicts (14%)
- explained: 19/21 conflicts by 2 root cause(s)
- metrics: hubs=7 (frac 0.189), conflicts/hub=3.0, max_incompat=5.93Å, chain_span=0.838
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Y27-Y30 + D33-Y37 — explain ~19/21 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y30** — severity 11.08, 7 conflict(s); suspect input ~`C3` (group: pull_in)
  - pull-in (wants closer): C3@3.8Å(now 11.1,conf 0.58)
  - push-out (wants farther): P35@14.9Å(now 8.3,conf 0.52), Y37@16.1Å(now 8.8,conf 0.34)
  - C3↔V34: targets 3.8/12.7Å but partners are 21.1Å apart → too_far_apart by 4.7Å
  - D33↔C3: targets 9.2/3.8Å but partners are 17.1Å apart → too_far_apart by 4.1Å
  - R23↔C3: targets 8.2/3.8Å but partners are 15.2Å apart → too_far_apart by 3.1Å
- **C28** — severity 5.72, 6 conflict(s); suspect input ~`D33` (group: pull_in)
  - pull-in (wants closer): Q8@3.8Å(now 8.7,conf 0.58)
  - push-out (wants farther): G24@7.2Å(now 4.6,conf 0.82), P35@15.4Å(now 12.2,conf 0.43)
  - Q8↔D33: targets 3.8/11.2Å but partners are 17.8Å apart → too_far_apart by 2.8Å
  - Q8↔V34: targets 3.8/14.0Å but partners are 21.7Å apart → too_far_apart by 3.9Å
  - N25↔Q8: targets 10.2/3.8Å but partners are 15.9Å apart → too_far_apart by 1.9Å
- **G1** — severity 3.02, 2 conflict(s); suspect input ~`Y37` (group: push_out)
  - push-out (wants farther): P4@10.9Å(now 5.0,conf 0.94), K5@11.6Å(now 6.5,conf 0.67), I6@11.4Å(now 7.3,conf 0.49), L7@11.5Å(now 5.5,conf 0.49), Y37@22.7Å(now 15.1,conf 0.49), Q8@10.8Å(now 7.6,conf 0.40)
  - D33↔Y37: targets 14.6/22.7Å but partners are 3.8Å apart → too_close_together by 4.3Å
  - Y37↔A19: targets 22.7/6.1Å but partners are 10.6Å apart → too_close_together by 5.9Å
- **Y27** — severity 2.02, 3 conflict(s); suspect input ~`V34` (group: pull_in)
  - pull-in (wants closer): V34@13.9Å(now 17.1,conf 0.26), Q8@5.4Å(now 8.0,conf 0.24)
  - R9↔V34: targets 4.1/13.9Å but partners are 21.7Å apart → too_far_apart by 3.7Å
  - V34↔Q8: targets 13.9/5.4Å but partners are 21.7Å apart → too_far_apart by 2.4Å
  - C10↔V34: targets 4.2/13.9Å but partners are 20.0Å apart → too_far_apart by 1.9Å
- **Y32** — severity 1.00, 1 conflict(s); suspect input ~`Y37` (group: push_out)
  - push-out (wants farther): P35@10.2Å(now 5.7,conf 0.69), Y37@13.2Å(now 6.1,conf 0.49)
  - P35↔Y37: targets 10.2/13.2Å but partners are 1.0Å apart → too_close_together by 2.0Å
- **C10** — severity 0.94, 1 conflict(s); suspect input ~`C3` (group: pull_in)
  - pull-in (wants closer): P17@6.9Å(now 10.1,conf 0.52)
  - push-out (wants farther): D13@7.8Å(now 4.6,conf 0.52), S14@9.0Å(now 3.8,conf 0.40)
  - P17↔C3: targets 6.9/11.9Å but partners are 3.1Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=19 · strand(E)=11 · 3-10(G)=6 · coil(C)=1

```
EHHHHHEGEHHHGHGHHEGGEGCEHEHHHEHEEHHHE
```

## Backbone H-bond Network

- total=29 · helix(i→i+4)=7 · sheet=22
  - V2 ↔ I6  (helix)
  - I6 ↔ C10  (helix)
  - C10 ↔ S14  (helix)
  - R12 ↔ C16  (helix)
  - N25 ↔ G29  (helix)
  - Y27 ↔ P31  (helix)
  - P31 ↔ P35  (helix)
  - G1 ↔ L7  (sheet)
  - G1 ↔ R9  (sheet)
  - G1 ↔ G18  (sheet)
  - G1 ↔ I21  (sheet)
  - L7 ↔ G18  (sheet)
  - L7 ↔ I21  (sheet)
  - L7 ↔ G26  (sheet)
  - R9 ↔ G18  (sheet)
  - R9 ↔ I21  (sheet)
  - R9 ↔ G24  (sheet)
  - R9 ↔ G26  (sheet)
  - G18 ↔ Y30  (sheet)
  - G18 ↔ Y32  (sheet)
  - … +9 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=28 · exposed=3 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=206 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=127 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.1086 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=14 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
